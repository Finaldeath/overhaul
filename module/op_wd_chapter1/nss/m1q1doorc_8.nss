void main()
{
    object oEnter = GetLastOpenedBy();
    if(GetLocalInt(oEnter,"NW_L_M1Q1DockGuard_Warn") == FALSE)
       AssignCommand(GetNearestObjectByTag("M1Q1DockGuard"),SpeakOneLinerConversation("M1Q1AGate",oEnter));
}
