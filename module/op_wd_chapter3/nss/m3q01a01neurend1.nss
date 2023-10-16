void main()


{

    if (GetLocalInt(GetModule(),"NW_G_M3Q01PLOTTRIALSTATUS") ==1  )

        {
        SetLocalInt(OBJECT_SELF,"NW_G_M3Q01PLOTCONVERSATIONABORTED",1);
        ActionStartConversation (OBJECT_SELF);
        }

}
