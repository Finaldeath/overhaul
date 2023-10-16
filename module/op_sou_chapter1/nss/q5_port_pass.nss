// when a player either bashes or passes a portcullis - tell all kobolds to move over in front of it
// (and therefor stop bashing doors etc').

void Move(object oKobold, object oWP)
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    object oAwayWP = GetNearestObjectByTag("Q5_WP_AWAY");
    int nRand = Random(2);
    AssignCommand(oKobold, ClearAllActions());
    if(nRand != 0)
        AssignCommand(oKobold, SpeakOneLinerConversation("q5_escape_trap", oPC));
    AssignCommand(oKobold, ActionMoveToObject(oAwayWP, TRUE));
    //AssignCommand(oKobold, ActionMoveAwayFromObject(oPC));
    AssignCommand(oKobold, ActionMoveToObject(oWP, TRUE));
    //AssignCommand(oKobold, ActionAttack(oPC));
}

void main()
{
    string sTag = GetTag(OBJECT_SELF);
    string sNum = GetStringRight(sTag, 1);
    string sWPTag = "Q5_WP_ATTACK" + sNum;
    object oWP = GetWaypointByTag(sWPTag);

    object oSorcerer = GetNearestObjectByTag("Q5_KOBOLD_SORCERER");
    object oAdept = GetNearestObjectByTag("Q5_KOBOLD_ADEPT");
    object oSer1 = GetNearestObjectByTag("Q5_KOBOLD_SER1");
    object oSer2 = GetNearestObjectByTag("Q5_KOBOLD_SER2");

    Move(oSorcerer, oWP);
    Move(oAdept, oWP);
    Move(oSer1, oWP);
    Move(oSer2, oWP);

    int n = 1;
    object oKobold = GetNearestObjectByTag("Q5_KOBOLD", OBJECT_SELF, n);
    float nDistance;
    while(oKobold != OBJECT_INVALID)
    {
        n++;
        nDistance = GetDistanceBetween(OBJECT_SELF, oKobold);
        if(nDistance > 40.0)
            return;
        Move(oKobold, oWP);
        oKobold = GetNearestObjectByTag("Q5_KOBOLD", OBJECT_SELF, n);
    }


}
