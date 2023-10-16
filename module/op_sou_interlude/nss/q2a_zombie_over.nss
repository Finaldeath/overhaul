// when the encounter is over Ali should init dialog

void AliTalk()
{
     object oAli = GetObjectByTag("Q2A_ALI");
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    float fDistance = GetDistanceBetween(oAli, oPC);
    if(fDistance >= 25.0) // if the player is too far away then Ali would not try to talk
        return;
    AssignCommand(oAli, ClearAllActions(TRUE));
    AssignCommand(oPC, ClearAllActions(TRUE));
    AssignCommand(oAli, SpeakStringByStrRef(40505));
    AssignCommand(oAli, ActionMoveToObject(oPC));
    AssignCommand(oAli, ActionStartConversation(oPC));
    int i = 1;
    object oBedine = GetNearestObjectByTag("Q2A_BEDINE", oAli, i);
    while(oBedine != OBJECT_INVALID)
    {
        AssignCommand(oBedine, ActionMoveAwayFromObject(oAli, FALSE, 20.0));
        i++;
        oBedine = GetNearestObjectByTag("Q2A_BEDINE", oAli, i);
    }
}

void main()
{
    AliTalk();
}
