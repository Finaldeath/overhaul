void main()
{
    string sTag = "NW_HEN_GRI";
    object oHenchman = GetNearestObjectByTag(sTag);
    object oEnter = GetEnteringObject();
    if (GetIsObjectValid(oHenchman) &&
        IsInConversation(oHenchman) == FALSE &&
        GetIsObjectValid(GetMaster(oHenchman)) == FALSE &&
        GetLocalInt(oEnter,"NW_L_Hailed_" + sTag) == FALSE)
    {
        SetLocalInt(oEnter,"NW_L_Hailed_" + sTag,TRUE);
        AssignCommand(oHenchman,SetFacingPoint(GetPosition(oEnter)));
        AssignCommand(oHenchman,SpeakOneLinerConversation("M1Q1F_GrinHail"));
    }
}
