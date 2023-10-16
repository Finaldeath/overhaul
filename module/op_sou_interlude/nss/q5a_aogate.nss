// Ao guard should talk to player if didn't talk yet

void Talk(object oPC)
{
    BeginConversation("", oPC);
}

void main()
{
    object oPC = GetLastOpenedBy();
    if (GetLocalInt(GetModule(),"X1_AOGUARDSPOKE")==0)
    {
        object oGuard = GetNearestObjectByTag("Q5A_AOGUARD");
        if(!GetIsInCombat(oGuard) && !IsInConversation(oGuard) && !GetIsDead(oGuard))
        {
            AssignCommand(oGuard, ClearAllActions());
            AssignCommand(oGuard, Talk(oPC));
        }
    }
}
