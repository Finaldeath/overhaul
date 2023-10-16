//::///////////////////////////////////////////////
//:: Chronicles of Abaran Area (OnEnter)
//:: Area_Opening_Ent.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Spawn in the creatures for the Chronicles of
     Abaran cutscene and launch the player on it.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 16, 2004
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC))
    {

////////Destroy all associates so they don't interfere with the cutscene.
        object oAssociate;
        int n;
        n = 1;

        //Destroy Familiars
        do
        {
            oAssociate = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC, n);
            DestroyObject(oAssociate);
            n++;
        } while (oAssociate != OBJECT_INVALID);
        //Destroy Animal Companions
        n = 1;
        do
        {
            oAssociate = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC, n);
            DestroyObject(oAssociate);
            n++;
        } while (oAssociate != OBJECT_INVALID);
        //Destroy Summoned Creatures
        n = 1;
        do
        {
            oAssociate = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC, n);
            DestroyObject(oAssociate);
            n++;
        } while (oAssociate != OBJECT_INVALID);

////////Launch Opening Cutscene
        //Make double sure to stop the PC in his tracks.
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, JumpToObject(oPC));

        //Enter cutscene mode
        SetCutsceneMode(oPC, TRUE);

        //Make them invisible and prevent hostile creatures from attacking.
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oPC);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectEthereal(), oPC);

        //Have the player launch the cutscene conversation with themselves.
        DelayCommand(0.5, AssignCommand(oPC, ActionStartConversation(oPC, "sc_st_0_open_1", TRUE, FALSE)));

        //Reset their facing to that of the waypoint
        object oWP = GetNearestObjectByTag("WP_CHRONICLES_START", oPC);
        float fWP = GetFacing(oWP);
        DelayCommand(1.0, AssignCommand(oPC, SetFacing(fWP)));
        DelayCommand(1.2, AssignCommand(oPC, SetCameraFacing(fWP, 10.0)));
    }
}
