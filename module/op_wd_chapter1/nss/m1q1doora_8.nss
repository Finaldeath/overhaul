void main()
{
    object oEnter = GetLastOpenedBy();
    if(GetLocalInt(oEnter,"NW_L_M1Q1BegGuard_Warn") == FALSE)
       AssignCommand(GetNearestObjectByTag("M1Q1BegGuard"),SpeakOneLinerConversation("M1Q1AGate",oEnter));
}
