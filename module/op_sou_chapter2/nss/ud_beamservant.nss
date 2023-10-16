//::///////////////////////////////////////////////
//:: Beam Servant (UserDefined)
//:: UD_BeamServant.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle the Beam Servant's movement.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 12, 2003
//:://////////////////////////////////////////////

void main()
{
    //Fire my AoE spell.
    ClearAllActions();
    ActionCastSpellAtObject(SPELL_WALL_OF_FIRE, OBJECT_SELF, METAMAGIC_EMPOWER, TRUE);

    //Renew my beam effect
    object oMaster = GetLocalObject(OBJECT_SELF, "oMaster");
//    effect eBeam = EffectBeam(VFX_BEAM_FIRE, OBJECT_SELF, BODY_NODE_CHEST);
//    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBeam, oMaster);

    //Set up my master's movement
    float fDelay = IntToFloat(Random(12)+6);
    AssignCommand(oMaster, ClearAllActions());
    AssignCommand(oMaster, ActionRandomWalk());
    DelayCommand(fDelay, SignalEvent(oMaster, EventUserDefined(5000)));
}
