void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    
    if((GetLocalInt(OBJECT_SELF,"M1Q02BeginChase") == 1) && (GetLocalInt(OBJECT_SELF,"M1Q02PrisonerDead") == 0))
        {
            ActionStartConversation(oPC,"M1Q02ALLFGU1");
            SetLocalInt(OBJECT_SELF,"M1Q02BeginChase",2);
        }
}
