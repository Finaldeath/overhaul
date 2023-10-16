//::///////////////////////////////////////////////
//:: Guardian Golem (UserDefined)
//:: UD_GuardianGolem.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle the journal entries OnDeath.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 8, 2003
//:://////////////////////////////////////////////

#include "x0_i0_common"

void DoInterjection(object oHench, object oPC, int MOD_EVENT_NUMBER);
int ValidForInterjection(object oPC, object oHench);
void CheckForInterjection(object oPC, int nEventNum);

void main()
{
    int iUDNum = GetUserDefinedEventNumber();

    //User-Defined OnSpawn (100)
    if (iUDNum == 100)
    {

    }

    //User-Defined OnHeartbeat (1001)
    if (iUDNum == 1001)
    {

    }

    //User-Defined OnPerceive (1002)
    if (iUDNum == 1002)
    {

    }

    //User-Defined OnAttacked (1005)
    if (iUDNum == 1005)
    {

    }

    //User-Defined OnDamaged (1006)
    if (iUDNum == 1006)
    {

    }

    //User-Defined OnDeath (1007)
    if (iUDNum == 1007)
    {
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

        //Increment the Destroyed Golems count.
        int iDestroyedGolems = GetLocalInt(GetModule(), "iDestroyedGolems");
        iDestroyedGolems++;
        SetLocalInt(GetModule(), "iDestroyedGolems", iDestroyedGolems);

        //Check for Henchmen Interjections/Pop Ups
        if (iDestroyedGolems == 1)
        {
            CheckForInterjection(oPC, 26);
        }
        else if (iDestroyedGolems == 5)
        {
            CheckForInterjection(oPC, 27);
        }
        else if (iDestroyedGolems == 10)
        {
            CheckForInterjection(oPC, 28);
        }
        //Add the appropriate journal entry.
        AddJournalQuestEntry("Journ_Ashtara_50", iDestroyedGolems, oPC, TRUE, TRUE);

        //If I was defeated through brute force...
        int bDisabled = GetLocalInt(OBJECT_SELF, "bDisabled");
        if (bDisabled == FALSE)
        {

            //Distribute XP to everyone (available multiple times)
            object oPC_XP = GetFirstPC();
            while (oPC_XP != OBJECT_INVALID)
            {
                int iXP = FloatToInt(GetJournalQuestExperience("Journ_Ashtara_End") * 0.03);
                GiveXPToCreature(oPC_XP, iXP);
                oPC_XP = GetNextPC();
            }
        }
        //If I was defeated with the help of the Golem-Maker's Ring...
        else
        {
            //Distribute XP to everyone (available multiple times)
            object oPC_XP = GetFirstPC();
            while (oPC_XP != OBJECT_INVALID)
            {
                int iXP = FloatToInt(GetJournalQuestExperience("Journ_Ashtara_End") * 0.05);
                GiveXPToCreature(oPC_XP, iXP);
                oPC_XP = GetNextPC();
            }
        }
    }

    //User-Defined OnDisturbed (1008)
    if (iUDNum == 1008)
    {

    }

    //User-Defined OnCombatRoundEnd (1003)
    if (iUDNum == 1003)
    {

    }

    //User-Defined OnDialog (1004)
    if (iUDNum == 1004)
    {

    }

    return;
}
void DoInterjection(object oHench, object oPC, int MOD_EVENT_NUMBER)
{
        AssignCommand(oHench, SetHasInterjection(oPC, TRUE, MOD_EVENT_NUMBER));
        AssignCommand(oHench, ClearAllActions());
        AssignCommand(oPC, ClearAllActions());
//        AssignCommand(oHench, ActionMoveToObject(oPC, TRUE, 6.0));
        AssignCommand(oHench, ActionStartConversation(oPC));
}
// * am I valid for doing an interjection
int ValidForInterjection(object oPC, object oHench)
{
    if (!IsInConversation(oPC)
        && GetDistanceBetweenLocations(GetLocation(oPC), GetLocation(oHench)) <= 20.0)
    {
        return TRUE;
    }
    return FALSE;
}
void CheckForInterjection(object oPC, int nEventNum)
{
    // * choose which henchmen gets to interject

    object oHench = GetHenchman(oPC);

    if (GetIsObjectValid(oHench) == TRUE)
    {

        if (ValidForInterjection(oPC, oHench))
        {
            // * one liners
            SetLocalInt(oHench, "X0_L_BUSY_SPEAKING_ONE_LINER", 1);

            AssignCommand(oHench, ClearAllActions(TRUE));
            SetOneLiner(TRUE, nEventNum, oHench);
            AssignCommand(oHench, SpeakOneLinerConversation("", oPC));

        }

    }

}
