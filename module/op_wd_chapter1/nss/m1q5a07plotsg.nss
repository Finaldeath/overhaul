void main()
{
    object oExit = GetExitingObject();
    if(oExit == GetLocalObject(GetModule(),"NW_G_oAldo") ||
       oExit == GetLocalObject(GetModule(),"NW_G_oAldoJr") ||
       oExit == GetLocalObject(GetModule(),"NW_G_oMattily") ||
       oExit == GetLocalObject(GetModule(),"NW_G_oBiddy"))
    {
        SetLocalInt(GetModule(),"NW_G_FamilyReturned",GetLocalInt(GetModule(),"NW_G_FamilyReturned") + 1 );
        if(GetLocalInt(GetModule(),"NW_G_FamilyReturned") +
           GetLocalInt(GetModule(),"NW_G_FamilyDead") >= 4)
        {
            SetLocalInt(GetModule(),"NW_G_PlotAldo",30);
            SetLocalObject(GetModule(),"NW_G_FamilyFollow",OBJECT_INVALID);
        }
    }
}
