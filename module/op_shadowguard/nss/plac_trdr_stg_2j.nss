#include "help_general"
#include "help_hench"
#include "inc_rob"

void main()
{
    object oPC = GetLastUsedBy();

    if (GetIsPC(oPC))
    {
        if (!(GetLocked(OBJECT_SELF)))
        {
            SetLocked(OBJECT_SELF, TRUE);

            ExportSingleCharacter(oPC);
            RemoveHenchman(oPC, GetHenchman(oPC));

            DestroyObject(GetAssociate( ASSOCIATE_TYPE_ANIMALCOMPANION, oPC));
            DestroyObject(GetAssociate( ASSOCIATE_TYPE_DOMINATED, oPC));
            DestroyObject(GetAssociate( ASSOCIATE_TYPE_FAMILIAR, oPC));
            DestroyObject(GetAssociate( ASSOCIATE_TYPE_HENCHMAN, oPC));
            DestroyObject(GetAssociate( ASSOCIATE_TYPE_SUMMONED, oPC));

//            AddJournalSingle("xxxxxxxx", 3, oPC);

            AddJournalSingle("JT_ST_1_MAIN", 20, oPC);

            if (!(GetIsOpen(OBJECT_SELF)))
                AssignCommand(OBJECT_SELF, PlayAnimation(ANIMATION_PLACEABLE_OPEN));

            string sTag = GetTag(OBJECT_SELF);

            object oWP = GetWaypointByTag("WP_STAGE_2_BEG");

            SetMapPinEnabled(oWP, TRUE);

            location lWP = GetLocation(oWP);

            SceneSpeak(oPC, "[You turn to look back at Ghaarak one last time before descending into the ship's bowels, only to the see the entire city covered in flame and ash...]");

            DelayCommand(3.5, FadeToBlack(oPC, FADE_SPEED_FAST));

/**///The previous ending (Shadowguard Barracks) has been cut.
/**///            DelayCommand(4.5, SetLocalInt(GetModule(), "N_MODULE_STAGE", 2));
/**/
/**///            DelayCommand(5.0, AssignCommand(oPC, JumpToLocation(lWP)));
/**/
/**/        //Set Cutscene Mode
/**/        DelayCommand (4.0, SetCutsceneMode(oPC, TRUE));
/**/
/**/        //Jump the player to the Voyager at sea.
/**/        object oWP_End = GetWaypointByTag("WP_VOYAGER_AT_SEA");
/**/        DelayCommand(4.1, AssignCommand(oPC, JumpToObject(oWP_End)));
/**/
/**/        //Make the player invisible
/**/        effect eInvis = EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY);
/**/        DelayCommand(4.2, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInvis, oPC));
/**/
/**/        //Save variables out to database.
/**/        DelayCommand(4.3, Rob_SaveDatabase(oPC));
/**/
/**/        //Cause the camera to rotate.
            DelayCommand(5.0, AssignCommand(oPC,
                SetCameraFacing(90.0, 30.0, 60.0)));

            DelayCommand(5.5, AssignCommand(oPC,
                SetCameraFacing(180.0, 10.0, 89.0, CAMERA_TRANSITION_TYPE_SLOW)));
            DelayCommand(9.0, AssignCommand(oPC,
                SetCameraFacing(270.0, 20.0, 75.0, CAMERA_TRANSITION_TYPE_SLOW)));
            DelayCommand(13.0, AssignCommand(oPC,
                SetCameraFacing(360.0, 25.0, 70.0, CAMERA_TRANSITION_TYPE_SLOW)));
            DelayCommand(17.0, AssignCommand(oPC,
                SetCameraFacing(90.0, 30.0, 65.0, CAMERA_TRANSITION_TYPE_SLOW)));
            DelayCommand(21.0,AssignCommand(oPC,
                SetCameraFacing(90.0, 35.0, 60.0, CAMERA_TRANSITION_TYPE_SLOW)));
/**/
/**/        //Fade in from black
/**/        DelayCommand(6.0, FadeFromBlack(oPC));
/**/
/**/        //Roll Credits
/**/        //DelayCommand(5.5, Rob_DefineCredits());
/**/        //DelayCommand(6.0, Rob_DisplayCredits());
/**/
            DelayCommand(21.0, FadeToBlack(oPC));
            DelayCommand(23.0, EndGame("dd_sg_credits"));

/**///The player can exit by aborting the cutscene (see module abort script).
        }

        else
            SceneSpeak(oPC, "[It appears this trap door is locked...]");
    }
}
