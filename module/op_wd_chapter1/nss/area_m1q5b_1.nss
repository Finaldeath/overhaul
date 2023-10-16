void main()
{
    object oEnter = GetEnteringObject();
    object oAldo = GetLocalObject(GetModule(),"NW_G_oAldo");
    object oMatily = GetLocalObject(GetModule(),"NW_G_oMattily");
    object oHector = GetLocalObject(GetModule(),"oHector104a");
    if(oEnter == oAldo || oEnter == oMatily)
    {
        SetLocalInt(oEnter,"NW_L_Safe",TRUE);
        if(GetLocalInt(oAldo,"NW_L_Safe") && GetLocalInt(oMatily,"NW_L_Safe"))
        {
            //AssignCommand(oEnter,SpeakString("Family Invalidating"));
            SetLocalInt(GetModule(),"NW_G_PlotAldo",30);
            SetLocalObject(GetModule(),"NW_G_FamilyFollow",OBJECT_INVALID);
        }
    }
    if(oEnter == oHector &&
       (GetLocalInt(GetModule(),"NW_G_PlotAldo") >= 30 || GetIsObjectValid(oAldo) == FALSE) )
    {
        //AssignCommand(oEnter,SpeakString("Hector Invalidating"));
        SetLocalObject(oEnter,"NW_L_FollowTarget",OBJECT_INVALID);
    }
}
