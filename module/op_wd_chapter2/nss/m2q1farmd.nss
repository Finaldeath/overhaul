///////////////////////////////////////////////////////////////////////////////
//:: Waypoint Script Combined with Farmer
//::
//:: Copyright (c) 2000 Bioware Corp.
///////////////////////////////////////////////////////////////////////////////
void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    int nEvent = GetUserDefinedEventNumber();
    switch (nEvent)
    {
        case 200:
        //* Encounter with Haljal
        {
            if ((GetDistanceToObject(oPC) < 10.0) && (GetDistanceToObject(GetObjectByTag("M2Q1CHALJAL")) < 5.0))
            {
                SetLocalInt(GetModule(),"M2Q1FarmerHaljalAmbient",1);
                ActionStartConversation(OBJECT_SELF);
            }
        }
        break;
        case 201:
        //* Encounter with Neurik
        {
            SetLocalInt(GetModule(),"M2Q1FarmerNeurikAmbient",1);
            ActionStartConversation(OBJECT_SELF);
        }
        break;
        case 202:
        //* Encounter with Farmer's Son
        {
            SetLocalInt(GetModule(),"M2Q1FarmerSonAmbient",1);
            ActionStartConversation(OBJECT_SELF);
        }
        break;
        case 203:
        //* Encounter with Farmer's Daughter
        {
            SetLocalInt(GetModule(),"M2Q1FarmerDaughterAmbient",1);
            ActionStartConversation(OBJECT_SELF);
        }
        break;
        case 204:
        //* Encounter with Farmer's Wife
        {
            SetLocalInt(GetModule(),"M2Q1FarmerWifeAmbient",1);
            ActionStartConversation(OBJECT_SELF);
        }
        break;

    }

}
