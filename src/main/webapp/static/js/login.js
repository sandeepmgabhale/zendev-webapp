Ext.require([
    'Ext.form.Panel',
    'Ext.window.Window'
]);

Ext.onReady(function () {
    var login = Ext.create('Ext.form.Panel', {
        url:ctx + '/login',
        frame:true,
        bodyStyle:'padding:7px 7px 0',
        defaults:{
            anchor:'100%'
        },
        defaultType:'textfield',
        fieldDefaults:{
            labelAlign:'right',
            labelWidth:49,
            msgTarget:'side',
            allowBlank:false
        },
        items:[
            {
                fieldLabel:'用户名',
                name:'username',
                id:'username',
                listeners:{
                    specialKey:function (field, e) {
                        if (e.getKey() == Ext.EventObject.ENTER) {
                            Ext.getCmp("password").focus();
                        }
                    }
                }

            },
            {
                fieldLabel:'密码',
                name:'password',
                id:'password',
                inputType:'password',
                listeners:{
                    specialKey:function (field, e) {
                        if (e.getKey() == Ext.EventObject.ENTER) {
                            Ext.getCmp("login-button").handler();
                        }
                    }
                }
            }
        ],
        buttons:[
            {
                text:'登录',
                id:'login-button',
                handler:function () {
                    var form = this.up('form').getForm();
                    if (form.isValid()) {
                        form.submit({
                            success:function () {
                                window.location = ctx;
                            },
                            failure:function (form, action) {
                                Ext.Msg.alert('Failed', action.result.msg);
                            }
                        });
                    }
                }
            }
        ]
    });

    var win = new Ext.Window({
        title:'系统登录',
        width:260,
        height:130,
        layout:'fit',
        closable:false,
        resizable:false,
        border:false,
        items:[login]
    });

    win.show();
    Ext.getCmp("username").focus('', 100);
});