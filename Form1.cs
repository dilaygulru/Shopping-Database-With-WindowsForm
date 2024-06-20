using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace WindowsFormsApp1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        NpgsqlConnection connect = new NpgsqlConnection("server=localhost; port=5432; Database=ShoppingDatabase; UserId = postgres;  password=17012001");

        private void button3_Click(object sender, EventArgs e)
        {

            string query = "select * from \"Users\"";
            NpgsqlDataAdapter adapt = new NpgsqlDataAdapter(query, connect);
            DataSet ds = new DataSet();
            adapt.Fill(ds);

            dataGridView1.DataSource = ds.Tables[0];


        }
        private void button2_Click(object sender, EventArgs e)
        {
            connect.Open();
            NpgsqlCommand command1 = new NpgsqlCommand("insert into \"Users\" values(@userID ,@username, @email, @sellerProfiles, @userProfiles)", connect);
            command1.Parameters.AddWithValue("@userProfiles", bool.Parse(textBox1.Text));
            command1.Parameters.AddWithValue("@sellerProfiles", bool.Parse(textBox2.Text));
            command1.Parameters.AddWithValue("@userID", int.Parse(textBox5.Text));
            command1.Parameters.AddWithValue("@username", (textBox3.Text));
            command1.Parameters.AddWithValue("@email", (textBox4.Text));

            command1.ExecuteNonQuery();
            connect.Close();

            MessageBox.Show("Users insert operations has been done successfully!");


        }
        private void button4_Click(object sender, EventArgs e)
        {
            
            connect.Open();

            
            NpgsqlCommand command2 = new NpgsqlCommand("DELETE FROM \"Users\" WHERE \"userID\" = @userID", connect);
            command2.Parameters.AddWithValue("@userID", int.Parse(textBox5.Text));

            int rowsAffected = command2.ExecuteNonQuery();

            connect.Close();

            if (rowsAffected > 0)
            {
                MessageBox.Show("User delete operation has been done successfully!");
            }
            else
            {
                MessageBox.Show("No user found with the specified userID.");
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            
            connect.Open();
            NpgsqlCommand command3 = new NpgsqlCommand("UPDATE \"Users\" SET \"username\" = @username, \"email\" = @email, \"sellerProfiles\" = @sellerProfiles," +
                " \"userProfiles\" = @userProfiles WHERE \"userID\" = @userID", connect);
            command3.Parameters.AddWithValue("@userID", int.Parse(textBox5.Text));
            command3.Parameters.AddWithValue("@username", textBox3.Text);
            command3.Parameters.AddWithValue("@email", textBox4.Text);
            command3.Parameters.AddWithValue("@sellerProfiles", bool.Parse(textBox2.Text));
            command3.Parameters.AddWithValue("@userProfiles", bool.Parse(textBox1.Text));

            int rowsAffected = command3.ExecuteNonQuery();
            connect.Close();

            if (rowsAffected > 0)
            {
                MessageBox.Show("User updated successfully!");
            }
            else
            {
                MessageBox.Show("User not found or update failed.");
            }
        }

    }
}
