﻿<%@ Page Title="" Language="C#" MasterPageFile="BackgroundManagement.Master" AutoEventWireup="true" CodeBehind="RestaurantList.aspx.cs" Inherits="Dian.Web.RestaurantList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="admin-content">

        <div class="am-cf am-padding">
            <div class="am-fl am-cf">
                <strong class="am-text-primary am-text-lg">店家管理</strong> / <small>
                    <label>列表</label></small>
            </div>
        </div>

        <div class="am-g">
            <div class="am-u-sm-12 am-u-md-6">
                <div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">
                        <button type="button" class="am-btn am-btn-default" onclick="beforeAdd();"><span class="am-icon-plus"></span>新增</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="am-g">
            <div class="am-u-sm-12">
                <div class="am-form">
                    <table class="am-table am-table-striped am-table-hover table-main">
                        <thead>
                            <tr>
                                <th class="table-id">ID</th>
                                <th class="table-name">店名</th>
                                <th class="table-level">等级</th>
                                <th class="table-area">区域</th>
                                <th class="table-set">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="repeater1" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("RESTAURANT_ID") %></td>
                                        <td><a href='RestaurantDetail.aspx?op=edit&id=<%# Eval("RESTAURANT_ID") %>'><%# Eval("RESTAURANT_NAME") %></a></td>
                                        <td><%# GetLevelName(Eval("LEVEL").ToString()) %></td>
                                        <td><%# GetAreaName(Eval("AREA").ToString()) %></td>
                                        <td>
                                            <div class="am-btn-toolbar">
                                                <div class="am-btn-group am-btn-group-xs">
                                                    <button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary am-hide-sm-only" onclick="beforeEdit('<%# Eval("RESTAURANT_ID") %>');"><span class="am-icon-pencil-square-o"></span>编辑</button>
                                                    <button type="submit" class="am-btn am-btn-default am-btn-xs am-text-danger" onclick="beforeDelete('<%# Eval("RESTAURANT_ID") %>');"><span class="am-icon-trash-o"></span>删除</button>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>

                    <div class="am-cf">
                        <label id="labelPage"></label>
                        <div class="am-fr" id="divPage">
                            <ul class="am-pagination">
                                <li><a id="aFirst" href="#">第一页</a></li>
                                <li><a id="aPrev" href="#">上一页</a></li>
                                <li><a id="aCur" href="#">1/3</a></li>
                                <li><a id="aNext" href="#">下一页</a></li>
                                <li><a id="aLast" href="#">最末页</a></li>
                            </ul>
                        </div>
                    </div>

                    <label id="lMsg" runat="server" class="am-text-warning"></label>

                </div>
            </div>
        </div>

    </div>

    <br />

    <input type="hidden" id="hDeleteId" runat="server" />

    <script type="text/javascript">

        $(function () {
            initPagination('<%= CurPage %>', '<%= TotalCount %>', '<%= PageCount %>', '<%= this.Request.Url.AbsolutePath %>');
        });

        function beforeAdd() {
            self.location.href = 'RestaurantDetail.aspx?op=add';
        }

        function beforeEdit(id) {
            self.location.href = 'RestaurantDetail.aspx?op=edit&id=' + id;
        }

        function beforeDelete(id) {
            $('#<%= this.hDeleteId.ClientID %>').val(id);
        }

    </script>

</asp:Content>
