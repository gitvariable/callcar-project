using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class managerCustomers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["m_name"] == null)
        {
            Response.Redirect("managerlogin.aspx");
        }
    }

    protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        GridView1.DataBind();
    }

    protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        GridView1.DataBind();
    }

    protected void DetailsView1_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        GridView1.DataBind();
    }

    protected void DetailsView1_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {

    }

    protected void DetailsView1_DataBound(object sender, EventArgs e)
    {
        Label1.Text = "";

        if (DetailsView1.Rows.Count != 0)
        {
            if (((Button)DetailsView1.Rows[9].Cells[0].Controls[2]).CommandName == "Delete")
            {
                ((Button)DetailsView1.Rows[9].Cells[0].Controls[2]).Attributes["onclick"] =
                    "javascript:if(!confirm('您確定要刪除資料嗎?')) return";
            }
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow myPageRow = GridView1.BottomPagerRow;
        DropDownList ddlPage = (DropDownList)myPageRow.Cells[0].FindControl("DropDownList1");

        if (sender is LinkButton)
        {
            switch (((LinkButton)sender).ID)
            {
                case "LinkButton1"://上頁
                    if (GridView1.PageIndex > 0)
                        ddlPage.SelectedIndex--;
                    break;
                case "LinkButton2"://下頁
                    if (ddlPage.SelectedIndex < ddlPage.Items.Count - 1)
                        ddlPage.SelectedIndex++;
                    break;
                case "LinkButton3"://第一頁
                    if (GridView1.PageIndex > 0)
                        ddlPage.SelectedIndex = 0;
                    break;
                case "LinkButton4"://最後一頁
                    if (GridView1.PageIndex >= 0)
                        ddlPage.SelectedIndex = GridView1.PageCount-1;
                    break;
            }
        }
        GridView1.PageIndex = ddlPage.SelectedIndex;
    }

    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        GridViewRow myPageRow = GridView1.BottomPagerRow;
        Label PagerInfo = (Label)myPageRow.Cells[0].FindControl("lblPageInfo");

        PagerInfo.Text = "Page " + (GridView1.PageIndex + 1) + " of " + GridView1.PageCount;
        //以上三列是由下面這一列做出來的
        //(Label)GridView2.BottomPagerRow.Cells[0].FindControl("lblPageInfo").Text = "Page " + (GridView2.PageIndex + 1) + " of " + GridView2.PageCount
        //GridView2裡的，BottomPagerRow，裡的Cells[0]，
        //有個Label裡面找控制項FindControl("lblPageInfo")的值設為
        //"Page" + (GridView2.PageIndex(頁面的第幾頁，從0開始所以後面要+1) + 1) + "of" + GridView2.PageCount(頁面的總數值)
        DropDownList ddlPage = (DropDownList)myPageRow.Cells[0].FindControl("DropDownList1");

        ListItem item;  //在迴圈外宣告增加效能，如在迴圈內，每跑一次就宣告一次
        for (int i = 0; i < GridView1.PageCount; i++)
        {
            item = new ListItem((i + 1).ToString()); //將i值+1後，轉為字串
            if (i == GridView1.PageIndex)
                item.Selected = true;
            ddlPage.Items.Add(item);
        }
    }

    //protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    string id = DetailsView1_txtC_ID.Text;
    //    //英文轉數字
    //    string[] eng1 = { "A", "B", "C", "D", "E", "F", "G", "H", "J", "K",
    //        "L", "M", "N", "P", "Q", "R", "S", "T", "U", "V", "X", "Y", "W", "Z", "I", "O" };
    //    int intEng = 0;
    //    for (int i = 0; i <= 25; i++)
    //    {
    //        if (eng1[i] == id.Substring(0, 1))
    //        {
    //            intEng = i + 10;
    //            break;
    //        }
    //    }
    //    int n1 = intEng / 10; //英文代碼第一位
    //    int n2 = intEng % 10; //英文代碼第二位

    //    int[] a = new int[9];
    //    for (int i = 0; i < a.Length; i++)
    //    {
    //        a[i] = Convert.ToInt16(id.Substring(i + 1, 1));
    //    }
    //    int num = 0;

    //    //很直接的寫法
    //    //int num = 0;
    //    //num = n1 + n2 * 9 + a[0] * 8 + a[1] * 7 + a[2] * 6 + a[3] * 5 + a[4] * 4 + a[5] * 3 + a[6] * 2 + a[7] + a[8];

    //    //演算法
    //    for (int m = 0; m < 8; m++)
    //    {
    //        num += a[m] * (8 - m);
    //    }
    //    num += n1 + n2 * 9 + a[8];

    //    if (num % 10 == 0)
    //        args.IsValid = true;
    //    else
    //        args.IsValid = false;

    //}

    protected void Buttonlogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("managerindex.aspx");
    }

    protected void BackButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("managerindex.aspx");
    }


    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e) 
    {
        DetailsView1.Visible = true;
        DetailsView2.Visible = false;
    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        DetailsView1.Visible = false;
        DetailsView2.Visible = true;
    }
}
