void main()
{
    object oEnter = GetEnteringObject();
    if(oEnter == GetLocalObject(GetModule(),"NW_G_Zelieph104a") &&
       GetLocalInt(OBJECT_SELF,"NW_L_TriggerFired") == FALSE)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_TriggerFired",TRUE);
        SetLocalInt(oEnter,"NW_L_M1Q5InWarehouse",TRUE);
        AssignCommand(oEnter,ClearAllActions());
        AssignCommand(oEnter,SpeakOneLinerConversation());
    }
}
