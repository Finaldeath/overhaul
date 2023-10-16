///////////////////////////////////////////////////////////////////////////////
void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    int nEvent = GetUserDefinedEventNumber();
    switch (nEvent)
    {
        case 200:
        {
            object oNearest = GetNearestObject(OBJECT_TYPE_WAYPOINT,OBJECT_SELF);
            SetLocalInt(GetModule(),"M2Q1JaxLeavesInn",2);
            ActionMoveToObject(oNearest);
            ActionDoCommand(DestroyObject(OBJECT_SELF));
        }
        break;
        case 201:
        {
            ActionStartConversation(OBJECT_SELF);
        }
        break;


    }

}
