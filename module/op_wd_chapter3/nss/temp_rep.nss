void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    SpeakString(IntToString(GetReputation(OBJECT_SELF, oPC)));
}
