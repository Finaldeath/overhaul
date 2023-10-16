//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName hx_ud_invis_dem
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will fire sounds and actions for the
     demon in the cutscene
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 29, 2003
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 4444)
    {
        object oDemon = GetObjectByTag("hx_cutx_demon");
        object oSound1 = GetObjectByTag("hx_devil_cut_dead");
        object oSound2 = GetObjectByTag("hx_cutx_devil_dead");
        location lLoc2 = GetLocation(GetObjectByTag("hx_hell_pit_cut"));

        DelayCommand(2.65, SoundObjectPlay(oSound1));
        DelayCommand(3.1, SoundObjectPlay(oSound2));
        DelayCommand(3.1, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), GetObjectByTag("hx_hell_pit_cut")));
        DelayCommand(3.2, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_CHUNK_RED_LARGE), lLoc2));
        DelayCommand(3.6, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_CHUNK_RED_LARGE), lLoc2));
        DelayCommand(3.0, AssignCommand(oDemon, ClearAllActions(TRUE)));

        DelayCommand(4.0, SoundObjectStop(oSound1));
        DelayCommand(6.5, SoundObjectStop(oSound2));
        DelayCommand(5.75, PlaySound("c_devil_bat2"));
        DelayCommand(5.8, AssignCommand(oDemon, PlayAnimation(ANIMATION_FIREFORGET_TAUNT)));
    }
}
