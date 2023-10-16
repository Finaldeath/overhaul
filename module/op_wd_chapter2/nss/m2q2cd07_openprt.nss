//::///////////////////////////////////////////////
//:: M2Q2CD07_OPENPRT.NSS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
      This opens the portcullises and allows the
      monsters to attack.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: January 29, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    object oDoor1 = GetObjectByTag("M2Q2CD07_PORTA");
    object oDoor2 = GetObjectByTag("M2Q2CD07_PORTB");
    object oDoor3 = GetObjectByTag("M2Q2CD07_PORTC");
    AssignCommand(oDoor1, ActionOpenDoor(oDoor1));
    AssignCommand(oDoor2, ActionOpenDoor(oDoor2));
    AssignCommand(oDoor3, ActionOpenDoor(oDoor3));
    int iCounter = 3;
    while (iCounter > 0)
    {
        object oMonster = GetNearestObjectByTag("M2Q2CD_FLESHPOR",OBJECT_SELF,iCounter);
//        object oMonster = GetNearestObjectByTag("M2Q2CD_MINPOR",OBJECT_SELF,iCounter);
//        object oMonster = GetNearestObjectByTag("M2Q2CD_HALFPORT",oPC,iCounter);
//        object oMonster = GetNearestObjectByTag("M2Q2CD_HALFPORT",OBJECT_SELF,iCounter);
        if (GetIsObjectValid(oMonster) == TRUE)
        {
            //location lChest = GetLocation(OBJECT_SELF);
//            AssignCommand(oMonster,SpeakString("Test!"));
            AssignCommand(oMonster,ActionMoveToLocation(GetLocation(OBJECT_SELF)));
            AssignCommand(oMonster, ActionAttack(oPC));
        }
        iCounter = iCounter - 1;
    }
}
