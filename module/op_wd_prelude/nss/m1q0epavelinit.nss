void main()
{
    object oPavel = GetNearestObjectByTag("M1Q0DPavel");
    object oPC= GetPCSpeaker();
    if (GetIsObjectValid(oPavel))
    {
        RemoveHenchman(oPC,oPavel);
        AssignCommand(oPavel,ClearAllActions());
        DelayCommand(0.5,AssignCommand(oPavel,ActionStartConversation(oPC)));
    }
}
