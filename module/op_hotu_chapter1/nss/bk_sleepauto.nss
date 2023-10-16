//::///////////////////////////////////////////////
//:: Name bk_sleep_auto
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script teleports the player to
    the "dream cutscene", first cutscene of the game

    Only fires if they came in as a low level character
    and needed to be leveled up first.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "NW_L_DOONCE") == 0)
    {
        object oPC = GetPCSpeaker();
        // unpolymorph player
        effect e = GetFirstEffect(oPC);
        while(GetIsEffectValid(e))
        {
            if(GetEffectType(e)==EFFECT_TYPE_POLYMORPH) RemoveEffect(oPC, e);
            e = GetNextEffect(oPC);
        }

        DelayCommand(1.0, AssignCommand(oPC, JumpToObject(GetObjectByTag("BK_STARTING_LOC"))));
        SetLocalInt(OBJECT_SELF, "NW_L_DOONCE", 10);
        // * turn off the low level start (0 = no start, 1 = start happened, done 10 = start inprogress
        SetLocalInt(GetModule(), "X2_G_LOWLEVELSTART", 1);
       FadeToBlack(oPC,FADE_SPEED_MEDIUM);
       //FadeFromBlack(oPC,FADE_SPEED_FAST);
    }
}
