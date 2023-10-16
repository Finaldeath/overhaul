
//::///////////////////////////////////////////////
//:: JumpTrial
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
       Jumps each individual in the trial
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
void JumpTrial(string sJumper, string sDestination)
{
    object oJumper =  GetObjectByTag(sJumper);
    SetPlotFlag(oJumper,TRUE);
    location lDestination = GetLocation(GetNearestObjectByTag(sDestination));
    effect eDoor = EffectVisualEffect(VFX_IMP_UNSUMMON);
    DelayCommand(0.5,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDoor, lDestination));
    AssignCommand(oJumper,ClearAllActions());
    DelayCommand(1.0,AssignCommand(oJumper, JumpToObject(GetObjectByTag(sDestination))));
    vector vFacing=GetPosition(GetNearestObjectByTag("M3Q1_IGLAND_SPAWN"));
    AssignCommand(oJumper, ActionDoCommand(SetFacingPoint(vFacing)));
    // * This is so you cannot attack OR talk to them during the trial
    // * If this doesn't work we'll have to add
    // * during Trial dialog.
}

void main()
{
    CreateObject(OBJECT_TYPE_CREATURE,"Igland3Q11", GetLocation(GetObjectByTag("M3Q1_IGLAND_SPAWN")));

/////Set TrialStatus to 1 (in progress)
/////Set TrialLawyer to PC Speaker
   // * July 2 2002
   // * Reduced delay on the participants appearing from 2 seconds to 1 second because
   // * if Igland starts talking before they are all there, it can break things.
    SetLocalInt(GetModule(),"NW_G_M3Q01PLOTTRIALSTATUS",1);
    SetLocalObject(GetModule(),"NW_G_M3Q01A01TRIALLAWYER",GetPCSpeaker());
    AssignCommand(GetPCSpeaker(), JumpToObject(GetObjectByTag("M3Q1_PC_SPAWN_TO")));
    DelayCommand(1.0,JumpTrial("Rolgan3Q11","M3Q1_ROGAN_JUMP"));
    // * spawn in

    DelayCommand(1.0,JumpTrial("MQ3JUROR4","M3Q1_AVERIK_SPAWN"));
    DelayCommand(1.0,JumpTrial("MQ3JUROR3","M3Q1_DALCIA_SPAWN"));
    DelayCommand(1.0,JumpTrial("MQ3JUROR1","M3Q1_EDEGARD_SPAWN"));
    DelayCommand(1.0,JumpTrial("MQ3JUROR2","M3Q1_JEVON_SPAWN"));
    DelayCommand(1.0,JumpTrial("Merc13Q11","M3Q1_LODAR_SPAWN"));
    DelayCommand(1.0,JumpTrial("MQ3JUROR5","M3Q1_PALLA_SPAWN"));
    DelayCommand(1.0,JumpTrial("UthgardtWi3Q11","M3Q1_VANDA_SPAWN"));
    DelayCommand(1.0,JumpTrial("Merc23Q11","M3Q1_ZED_SPAWN"));

    DelayCommand(1.0,JumpTrial(GetTag(OBJECT_SELF),"M3Q1_NEURIK_WALKTO"));
    SetCameraFacing(DIRECTION_NORTH);

}
