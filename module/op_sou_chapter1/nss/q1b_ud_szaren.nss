//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q1b_ud_szaren
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Szaren will cast light on himself at night
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 19/03
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if (GetIsNight() == TRUE && GetLocalInt(OBJECT_SELF, "nLight") != 1 && IsInConversation(OBJECT_SELF) == FALSE && GetIsInCombat() == FALSE)
        {
            ActionCastFakeSpellAtObject(SPELL_LIGHT, OBJECT_SELF);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_LIGHT), OBJECT_SELF, 600.0);
            SetLocalInt(OBJECT_SELF, "nLight", 1);
            DelayCommand(600.0, SetLocalInt(OBJECT_SELF, "nLight", 0));
        }
    }



}

