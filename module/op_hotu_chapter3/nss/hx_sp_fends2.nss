//::///////////////////////////////////////////////
//:: Name hx_sp_fends
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Spawn for ending creatures. Turns them invis.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 22, 2003
//:://////////////////////////////////////////////

void main()
{
    object oSelf = OBJECT_SELF;
    string sFate = GetLocalString(GetModule(), "sMephistophelesFate");
    effect eEffect = EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY);

    SetIsDestroyable(FALSE, TRUE, FALSE);

    if(GetLocalInt(GetModule(), "bMephCommandedToFight") == TRUE)
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDeath(), OBJECT_SELF);
    }
    //ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDeath(), OBJECT_SELF);
    else if (sFate == "Servant" ||
        sFate == "Chambermaid" ||
        sFate == "HellServant")
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectKnockdown(), OBJECT_SELF);
    }
    //else if (sFate == "CeaseExist" || sFate == "NotCommanded")
    else if (sFate == "CeaseExist")
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDeath(), OBJECT_SELF);
    }
    else
    {
        ;
    }
}
