//::///////////////////////////////////////////////
//:: Crypt_03 Maze Room (OnEnter)
//:: En_MazeRoom.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Give XP for exploring the room.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 10, 2003
//:://////////////////////////////////////////////

void main()
{
    //Do this once per person per trigger
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {
        string sPC = GetPCPlayerName(oPC);
        int bPC = GetLocalInt(OBJECT_SELF, sPC);
        if (bPC == FALSE)
        {
            //Give the player XP.
            int iXP = FloatToInt(GetJournalQuestExperience("Journ_Crypt_End") * 0.02);
            GiveXPToCreature(oPC, iXP);

            //Flag the per-PC DoOnce
            SetLocalInt(OBJECT_SELF, sPC, TRUE);
        }
    }
}
