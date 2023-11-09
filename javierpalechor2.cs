using CL_Capa_Entidades;
using Org.BouncyCastle.Asn1.Mozilla;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CL_Capa_Datos
{
    public class DA_FULLMARKET : DA_BASE
    {
        public static bool InsertarFullMarket(FullMarket objFullMarket)
        {
            string strSQL = "Insert into FullMarket" +
                " (nit, razonSocial, direccion, telefono, correo, direccionWeb) values (";
            strSQL += "'" + objFullMarket.nit + "',";
            strSQL += "'" + objFullMarket.razonSocial + "',";
            strSQL += "'" + objFullMarket.direccion + "',";
            strSQL += "'" + objFullMarket.telefono + "',";
            strSQL += "'" + objFullMarket.correo + "',";
            strSQL += "'" + objFullMarket.direccionWeb + "');";

            return RealizarTransaccion(strSQL);

            }
        public static DataTable ConsultarFullMarket()
        {
            DataTable dt = new DataTable();
            string strSQL = "select nit,razonSocial,direccion,telefono,correo,direccionWeb" +
                " from fullmarket where idFullMarket=1;";
            
            return consultarDatos(strSQL);


        }
        public static bool ActualizarFullMarket(FullMarket objFullMarket)
        {
            string strSQL = "Update fullMarket set ";

            strSQL += "nit = '" + objFullMarket.nit + "',";
            strSQL += "razonSocial = '" + objFullMarket.razonSocial + "',";
            strSQL += "direccion = '" + objFullMarket.direccion + "',";
            strSQL += "telefono = '" + objFullMarket.telefono + "',";
            strSQL += "correo = '" + objFullMarket.correo + "',";
            strSQL += "direccionWeb = '" + objFullMarket.direccionWeb + " 'WHERE idFullMarket = 1;";

            return RealizarTransaccion(strSQL);

        }
        
        }
    }

