using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.Odbc;
using System.IO;
using System.Security.Cryptography;
using System.Text;
namespace MakeorbuyLeadScheduler
{
    public class DBConnect
    {
        String plainText;
        ASCIIEncoding ASCIIenc;
        String passPhrase;
        String saltValue;
        String hashAlgorithm;
        int passwordIterations;
        int keySize;
        String initVector;      
        public string CheckStatus { get; set; }

        public OdbcConnection GeoDBMainCon()
        {
            OdbcConnection aCon;
            aCon = GetOdbcCon("MySQL ODBC 5.1 Driver", "192.168.2.5", "siva", "delphi", "makeorbuy");
            return aCon;
        }
        public OdbcConnection GetOdbcCon(String Driver, String Server, String User, String Password, String DbName)
        {
            OdbcConnection aCon;
            String aStr = "Driver={" + Driver + "};server=" + Server + ";uid=" + User + ";pwd=" + Password + ";database=" + DbName;
            aCon = new OdbcConnection(aStr);
            aCon.Open();
            return aCon;
        }
       
        public SqlConnection buildsmartcon()
        {
            SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString);
            sqlcon.Open();
            return sqlcon;
        }
        public SqlDataReader Readfrombuildsmart(String query)
        {
            SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString);
            SqlCommand cmd = new SqlCommand(query, sqlcon);
            SqlDataReader dr;
            sqlcon.Open();
            dr = cmd.ExecuteReader();
            return dr;
        }
        public String GetPrivilege(String aModule, string EmpCode)
        {
            String PrivilegeStr;
            OdbcConnection SqlCon;
            PrivilegeStr = "";
            SqlCon = GeoDBMainCon();
            OdbcDataAdapter DbAdaptor;
            DbAdaptor = new OdbcDataAdapter("Select Privilege from privileges WHERE " + " Module = '" + aModule + "'" + " AND EmpCode = " + "'" + EmpCode + "'", SqlCon);
            DataSet Dtaset = new DataSet();
            DbAdaptor.Fill(Dtaset, "privileges");
            DbAdaptor.Dispose();
            if (Dtaset.Tables[0].Rows.Count > 0)
            {
                PrivilegeStr = Dtaset.Tables[0].Rows[0]["Privilege"].ToString();
            }
            return PrivilegeStr;
        }
        public String MD5(String number, SByte EnorDc = 0)
        {
            // 'Create an encoding object to ensure the encoding standard for the source text 
            String strReturn;
            if (EnorDc == 0)
            {
                //'Retrieve a byte array based on the source text  
                Byte[] ByteSourceText = ASCIIenc.GetBytes(number);
                // 'Instantiate an MD5 Provider object  
                MD5CryptoServiceProvider Md5Hash = new MD5CryptoServiceProvider();
                //  'Compute the hash value from the source  
                Byte[] ByteHash = Md5Hash.ComputeHash(ByteSourceText);
                //  'Cycle through the hash and convert to string  
                strReturn = "";
                foreach (Byte b in ByteHash)
                {
                    // 'Convert byte(s) to string  
                    strReturn += b.ToString("x2");
                }
                //  'Return the result  
                return strReturn;
            }
            else
            {
                plainText = "Hello, World!";  // ' original plaintext
                passPhrase = "Pas5pr@se";    // ' can be any string
                saltValue = "s@1tValue";      //' can be any string
                hashAlgorithm = "SHA1";        //  ' can be "MD5"
                passwordIterations = 2;         //    ' can be any number
                initVector = "@1B2c3D4e5F6g7H8";//' must be 16 bytes
                keySize = 256;        // ' can be 192 or 128
                if (EnorDc == 1)
                {
                    strReturn = Encrypt(number, passPhrase, saltValue, hashAlgorithm, passwordIterations, initVector, keySize);
                }
                else
                {
                    strReturn = Decrypt(number, passPhrase, saltValue, hashAlgorithm, passwordIterations, initVector, keySize);
                }
                return strReturn;
            }
        }
        public String Decrypt(String cipherText,
                                   String passPhrase,
                                   String saltValue,
                                   String hashAlgorithm,
                                   int passwordIterations,
                                   String initVector,
                                  int keySize)
        {

            // ' Convert strings defining encryption key characteristics into byte
            // ' arrays. Let us assume that strings only contain ASCII codes.
            // ' If strings include Unicode characters, use Unicode, UTF7, or UTF8
            // ' encoding.
            Byte[] initVectorBytes;
            initVectorBytes = Encoding.ASCII.GetBytes(initVector);

            Byte[] saltValueBytes;
            saltValueBytes = Encoding.ASCII.GetBytes(saltValue);

            // ' Convert our ciphertext into a byte array.
            Byte[] cipherTextBytes;
            cipherTextBytes = Convert.FromBase64String(cipherText);

            // ' First, we must create a password, from which the key will be 
            //' derived. This password will be generated from the specified 
            //  ' passphrase and salt value. The password will be created using
            //   ' the specified hash algorithm. Password creation can be done in
            //   ' several iterations.
            PasswordDeriveBytes password;
            password = new PasswordDeriveBytes(passPhrase,
                                               saltValueBytes,
                                               hashAlgorithm,
                                               passwordIterations);

            //  ' Use the password to generate pseudo-random bytes for the encryption
            //   ' key. Specify the size of the key in bytes (instead of bits).
            Byte[] keyBytes;
            keyBytes = password.GetBytes(keySize / 8);
            // ' Create uninitialized Rijndael encryption object.
            RijndaelManaged symmetricKey;
            symmetricKey = new RijndaelManaged();

            // ' It is reasonable to set encryption mode to Cipher Block Chaining
            //' (CBC). Use default options for other symmetric key parameters.
            symmetricKey.Mode = CipherMode.CBC;
            /// ' Generate decryptor from the existing key bytes and initialization 
            // ' vector. Key size will be defined based on the number of the key 
            // ' bytes.
            ICryptoTransform decryptor;
            decryptor = symmetricKey.CreateDecryptor(keyBytes, initVectorBytes);
            // ' Define memory stream which will be used to hold encrypted data.
            MemoryStream memoryStream;
            memoryStream = new MemoryStream(cipherTextBytes);

            //  ' Define memory stream which will be used to hold encrypted data.
            CryptoStream cryptoStream;
            cryptoStream = new CryptoStream(memoryStream, decryptor,CryptoStreamMode.Read);

            //  ' Since at this point we don't know what the size of decrypted data
            //  ' will be, allocate the buffer long enough to hold ciphertext;
            //  ' plaintext is never longer than ciphertext.
            Byte[] plainTextBytes;
            plainTextBytes = new Byte[cipherTextBytes.Length];

            // ' Start decrypting.
            int decryptedByteCount;
            decryptedByteCount = cryptoStream.Read(plainTextBytes, 0, plainTextBytes.Length);

            // ' Close both streams.
            memoryStream.Close();
            cryptoStream.Close();

            //' Convert decrypted data into a string. 
            //' Let us assume that the original plaintext string was UTF8-encoded.
            String plainText;
            plainText = Encoding.UTF8.GetString(plainTextBytes, 0, decryptedByteCount);

            //  ' Return decrypted string.
            // Decrypt = plainText;
            return plainText;
        }
        public String Encrypt(String plainText, String passPhrase, String saltValue, String hashAlgorithm, int passwordIterations, String initVector, int keySize)
        {
            // ' Convert strings into byte arrays.
            // ' Let us assume that strings only contain ASCII codes.
            // ' If strings include Unicode characters, use Unicode, UTF7, or UTF8 
            //  ' encoding.
            Byte[] initVectorBytes;
            initVectorBytes = Encoding.ASCII.GetBytes(initVector);

            Byte[] saltValueBytes;
            saltValueBytes = Encoding.ASCII.GetBytes(saltValue);

            // ' Convert our plaintext into a byte array.
            // ' Let us assume that plaintext contains UTF8-encoded characters.
            Byte[] plainTextBytes;
            plainTextBytes = Encoding.UTF8.GetBytes(plainText);

            // ' First, we must create a password, from which the key will be derived.
            // ' This password will be generated from the specified passphrase and 
            /// ' salt value. The password will be created using the specified hash 
            // ' algorithm. Password creation can be done in several iterations.
            PasswordDeriveBytes password;
            password = new PasswordDeriveBytes(passPhrase, saltValueBytes, hashAlgorithm, passwordIterations);

            //  ' Use the password to generate pseudo-random bytes for the encryption
            //  ' key. Specify the size of the key in bytes (instead of bits).
            Byte[] keyBytes;
            keyBytes = password.GetBytes(Convert.ToInt16(keySize / 8));

            //' Create uninitialized Rijndael encryption object.
            RijndaelManaged symmetricKey;
            symmetricKey = new RijndaelManaged();

            //  ' It is reasonable to set encryption mode to Cipher Block Chaining
            //  ' (CBC). Use default options for other symmetric key parameters.
            symmetricKey.Mode = CipherMode.CBC;

            //' Generate encryptor from the existing key bytes and initialization 
            // ' vector. Key size will be defined based on the number of the key 
            // ' bytes.
            ICryptoTransform encryptor;
            encryptor = symmetricKey.CreateEncryptor(keyBytes, initVectorBytes);

            //  ' Define memory stream which will be used to hold encrypted data.
            MemoryStream memoryStream = new MemoryStream();


            //  ' Define cryptographic stream (always use Write mode for encryption).
            CryptoStream cryptoStream;
            cryptoStream = new CryptoStream(memoryStream, encryptor, CryptoStreamMode.Write);
            // ' Start encrypting.
            cryptoStream.Write(plainTextBytes, 0, plainTextBytes.Length);

            // ' Finish encrypting.
            cryptoStream.FlushFinalBlock();

            // ' Convert our encrypted data from a memory stream into a byte array.
            Byte[] cipherTextBytes;
            cipherTextBytes = memoryStream.ToArray();

            // ' Close both streams.
            memoryStream.Close();
            cryptoStream.Close();

            //' Convert encrypted data into a base64-encoded string.
            String cipherText;
            cipherText = Convert.ToBase64String(cipherTextBytes);

            // ' Return encrypted string.
            //  Encrypt = cipherText;
            return cipherText;
        }
    }
}