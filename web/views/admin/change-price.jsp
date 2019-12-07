<%@page import="com.alphacab.model.JourneyPriceRateBean"%>
<% JourneyPriceRateBean price = (JourneyPriceRateBean) request.getAttribute("priceRate");%>
<div class="invoice-box">
    <div class="title">
        <h2>Change Price</h2>
    </div>

    <div class="invoice-box">
    <form action="<%=request.getContextPath()%>/change-price" method="post" name="bookaride">
        <table cellpadding="0" cellspacing="0">
            <tr class="heading">
                <td>
                    Current price per meter
                </td>
                <td>
                    <!--Original price-->
                    MVR
                    <%=price.getPriceRate()%>
                </td>
            </tr>

            <tr class="item">
                <td>
                </td>   
            </tr>
            <tr class="heading">
                <td>
                    New price per meter 
                </td>
                <td>
                    <input type="number" step="0.01" min="0" name="newPriceRate" placeholder="Change Price"/>
                </td>
            </tr>
        </table>
        </div>
        <button type="submit" class="mdc-button mdc-button--raised">
            <!--  <i class="material-icons mdc-button__icon" aria-hidden="true">home</i> -->
            <span class="mdc-button__label">Submit</span>
        </button>
    </form>
</div>


<style>
    .invoice-box {
        max-width: 800px;
        margin: auto;
        margin-top: 30px;
        padding: 30px;
        border: 1px solid #eee;
        box-shadow: 0 0 10px rgba(0, 0, 0, .15);
        font-size: 16px;
        line-height: 24px;
        font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
        color: #555;
    }

    .invoice-box table {
        width: 100%;
        line-height: inherit;
        text-align: left;
    }

    .invoice-box table td {
        padding: 5px;
        vertical-align: top;
    }

    .invoice-box table tr td:nth-child(2) {
        text-align: right;
    }

    .invoice-box table tr.top table td {
        padding-bottom: 10px;
    }

    .invoice-box table tr.top table td.title {
        font-size: 45px;
        line-height: 15px;
        color: #333;
    }

    .invoice-box table tr.information table td {
        padding-bottom: 40px;
    }

    .invoice-box table tr.heading td {
        background: #eee;
        border-bottom: 1px solid #ddd;
        font-weight: bold;
    }

    .invoice-box table tr.details td {
        padding-bottom: 20px;
    }

    .invoice-box table tr.item td{
        border-bottom: 1px solid #eee;
    }

    .invoice-box table tr.item.last td {
        border-bottom: none;
    }

    .invoice-box table tr.total td:nth-child(2) {
        border-top: 2px solid #eee;
        font-weight: bold;
    }
    .title{
        text-align: center;
    }

    @media only screen and (max-width: 600px) {
        .invoice-box table tr.top table td {
            width: 100%;
            display: block;
            text-align: center;
        }

        .invoice-box table tr.information table td {
            width: 100%;
            display: block;
            text-align: center;
        }
    }

    /** RTL **/
    .rtl {
        direction: rtl;
        font-family: Tahoma, 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
    }

    .rtl table {
        text-align: right;
    }

    .rtl table tr td:nth-child(2) {
        text-align: left;
    }
</style>