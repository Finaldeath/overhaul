void main()
{
    object oPrichev = GetObjectByTag("M2Q01CPRICHEV");
    object oMung = GetObjectByTag("M2Q01CMUNG");

    if (GetLocalInt(GetModule(), "M2Q1A00SAILPLOT") < 20)
    {
        SetLocalInt(oPrichev,"NW_L_TalkingToMung",10);
        AssignCommand(oPrichev,ActionStartConversation(oMung));
    }
}
