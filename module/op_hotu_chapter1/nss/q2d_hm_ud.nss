//::///////////////////////////////////////////////
//:: Name x2_def_userdef
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default On User Defined Event script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

void main()
{
    int nEvent = GetUserDefinedEventNumber();

    if(nEvent == 101) // portal is firing bolts
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_WARN_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_WARN_ONCE", 1);

        DelayCommand(3.0, SpeakStringByStrRef(84097));
        DelayCommand(3.0, PlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL, 1.0, 3.0));
        DelayCommand(3.5, ActionCastSpellAtObject(SPELL_PROTECTION_FROM_ELEMENTS, OBJECT_SELF));
        DelayCommand(3.5, ActionCastSpellAtObject(SPELL_TRUE_SEEING, OBJECT_SELF));
        DelayCommand(3.5, ActionCastSpellAtObject(SPELL_PRAYER, OBJECT_SELF));
        DelayCommand(3.5, ActionCastSpellAtObject(SPELL_BULLS_STRENGTH, OBJECT_SELF));
        DelayCommand(3.5, ActionCastSpellAtObject(SPELL_ENDURANCE, OBJECT_SELF));
        DelayCommand(3.5, ActionCastSpellAtObject(SPELL_SHIELD_OF_FAITH, OBJECT_SELF));
        // The rest of the drow read the following var each HB:
        DelayCommand(3.0, SetLocalInt(GetArea(OBJECT_SELF), "PREPARE", 1));
    }

}


