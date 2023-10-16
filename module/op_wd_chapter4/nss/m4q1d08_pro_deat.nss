//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Script that runs when any protecto dies, destroying the protection item that Morag has

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    SetCommandable(TRUE);

    object oMorag = GetObjectByTag("M4Q01D08MORA");
    object oItem =GetItemPossessedBy(oMorag, GetTag(OBJECT_SELF));

    if (GetIsObjectValid(oItem) == TRUE)
    {
        DestroyObject(oItem);
        effect eVis = EffectVisualEffect(VFX_IMP_BREACH);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oMorag);
//        AssignCommand(oMorag, SpeakString("boo"));
    }


    if(GetTag(OBJECT_SELF) == "M4Q1D08_IMM_FIRE")
    {
        DestroyObject(GetNearestObjectByTag("M4Q1D2_FIRE"));
    }

    else if (GetTag(OBJECT_SELF) == "M4Q1D08_IMM_COLD")
    {
        DestroyObject(GetNearestObjectByTag("M4Q1D2_COLD"));
    }

    else if(GetTag(OBJECT_SELF) == "M4Q1D08_IMM_OTHE")
    {
        DestroyObject(GetNearestObjectByTag("M4Q1D2_OTHE"));
        // * The 'Other/Lessers' Guardian needs to destroy
        // * the magical item protection item on Morag

        DestroyObject(GetItemPossessedBy(oMorag, "M4Q1D09_IMM_MAG"));


    }

    else if(GetTag(OBJECT_SELF) == "M4Q1D08_IMM_BLUN")
    {
        DestroyObject(GetNearestObjectByTag("M4Q1D2_BLUN"));
    }

    else if(GetTag(OBJECT_SELF) == "M4Q1D08_IMM_PIER")
    {
        DestroyObject(GetNearestObjectByTag("M4Q1D2_PIER"));
    }

    else if(GetTag(OBJECT_SELF) == "M4Q1D08_IMM_ELEC")
    {
        DestroyObject(GetNearestObjectByTag("M4Q1D2_ELEC"));
    }
    else if(GetTag(OBJECT_SELF) == "M4Q1D08_IMM_SLAS")
    {
        DestroyObject(GetNearestObjectByTag("M4Q1D2_SLAS"));
    }
    else if(GetTag(OBJECT_SELF) == "M4Q1D08_IMM_POIS")
    {
        DestroyObject(GetNearestObjectByTag("M4Q1D2_POIS"));
    }
}
