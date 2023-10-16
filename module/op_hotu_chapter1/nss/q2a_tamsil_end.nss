//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
At the end of conversation, Tamsil will move to
the top of the stairs, destroy herself, and create
a copy of herself downstairs...
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On: Nov 6/02
//:://////////////////////////////////////////////

#include "inc_plot_locals"


void main()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(OBJECT_SELF, "nEnded") != 1)
    {
        //if (GetIsObjectValid(oPC))
        //{
            //Open the door to the common room for multi-player PCs
            object oCommon = GetObjectByTag("q2a_door_common");
            object oTamsil = OBJECT_SELF;
            SetLocked(oCommon, FALSE);
            AssignCommand(oCommon, ActionOpenDoor(oCommon));

            //Open the door to the downstairs..
            object oDoor = GetObjectByTag("at_ypupstairs_ypmain");
            SetLocked(oDoor, FALSE);
            DelayCommand(5.0, AssignCommand(oDoor, ActionOpenDoor(oDoor)));

            SetLocalInt(OBJECT_SELF, "nEnded", 1);
            //Move Tamsil to the end of the Hall - destroy this version and spawn in
            //the new tamsil downstairs.
            AssignCommand(OBJECT_SELF, ActionMoveToLocation(GetLocation(GetWaypointByTag("wp_q2a_stairsdown")), TRUE));
            DelayCommand(9.0, SetPlotFlag(oTamsil, FALSE));
            DestroyObject(OBJECT_SELF, 9.5);
            SetCommandable(FALSE);
            CreateObject(OBJECT_TYPE_CREATURE, "tamsil1", GetLocation(GetWaypointByTag("q2a_tamsil_spawn")));


            SetLocalInt(GetModule(),"q2atamsiltalk", 10);
            TamsilGavePCNote(oPC);
            AddJournalQuestEntry("q2aArmory",10,GetFirstPC());
            AddJournalQuestEntry("awakenings",89,GetFirstPC());

        //}
    }
}
