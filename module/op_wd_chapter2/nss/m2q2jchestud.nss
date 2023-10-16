void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    int nEvent = GetUserDefinedEventNumber();
    switch (nEvent)
    {
        case 200:
        {
            DestroyObject(GetItemPossessedBy(OBJECT_SELF,"M2Q1ITGEMSETARA"));
        }
        break;
    }

}
