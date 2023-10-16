//::///////////////////////////////////////////////
//:: Waitress User Defined
//:: 2Q4_Waitress_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Make the waitress walk around the bar and
    serve drinks.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 31, 2002
//:://////////////////////////////////////////////

void main()
{
     /*
    int nUser = GetUserDefinedEventNumber();
    int nRandom = d8();
    object oCustomer = GetLocalObject(OBJECT_SELF, "NW_2Q4_CUTLASS_CUSTOMER");
    object oWay = GetWaypointByTag("2Q4_Bar");

    if(nUser == 1001)
    {
        if(!GetIsObjectValid(oCustomer))
        {
            oCustomer = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_NOT_PC, OBJECT_SELF, nRandom);
            if(GetIsObjectValid(oCustomer) && oCustomer != OBJECT_SELF)
            {
                //Move to Customer
                SetLocalInt(OBJECT_SELF, "NW_2Q4_BARMAID_STATE", 1);
                SetLocalObject(OBJECT_SELF, "NW_2Q4_CUTLASS_CUSTOMER", oCustomer);
                ActionMoveToObject(oCustomer);
                ActionDoCommand(SpeakOneLinerConversation("2Q4_WaitTables"));
                //ActionWait(1.0);
                //Move to Aruph
                ActionDoCommand(SetLocalInt(OBJECT_SELF, "NW_2Q4_BARMAID_STATE", 2));
                ActionMoveToObject(oWay);
                ActionDoCommand(SpeakOneLinerConversation("2Q4_WaitTables"));
                //ActionWait(1.0);
                //Move back to the customer
                ActionDoCommand(SetLocalInt(OBJECT_SELF, "NW_2Q4_BARMAID_STATE", 3));
                ActionMoveToObject(oCustomer);
                ActionDoCommand(SpeakOneLinerConversation("2Q4_WaitTables"));
                //ActionWait(3.0);
                ActionDoCommand(SetLocalObject(OBJECT_SELF, "NW_2Q4_CUTLASS_CUSTOMER", OBJECT_INVALID));

            }
        }
    }
    if(nUser == 1004)
    {
        SetLocalObject(OBJECT_SELF, "NW_2Q4_CUTLASS_CUSTOMER", OBJECT_INVALID);
        SetLocalInt(OBJECT_SELF, "NW_2Q4_BARMAID_STATE", 0);
    }
    */
}
