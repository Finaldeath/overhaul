void main()
{
    object oEnter = GetLastOpenedBy();
    if(GetLocalInt(oEnter,"NW_L_M1Q1PenGuard_Warn") == FALSE)
       AssignCommand(GetNearestObjectByTag("M1Q1PenGuard"),SpeakOneLinerConversation("M1Q1AGate",oEnter));
}
