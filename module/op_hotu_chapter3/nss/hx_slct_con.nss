//::///////////////////////////////////////////////
//:: Name hx_slct_con
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will have "creature sound set" creatures
     give a solicit line when first clicked on.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 16, 2003
//:://////////////////////////////////////////////

void main()
{
    string sTag = GetTag(OBJECT_SELF);

    if(sTag == "H2_Imp")
    {
        PlaySound("c_mephit_slct");
    }
    else if(sTag == "H2_PitFiend")
    {
        PlaySound("c_demon_slct");
    }
    else if(sTag == "H2_Erinyes")
    {
        PlaySound("c_succubus_slct");
    }
    else if(sTag == "H2_SpiritFemale")
    {
        PlaySound("vs_fx0quief_slct");
    }
    else if(sTag == "H2_SpiritMale")
    {
        PlaySound("vs_fx2fighm_slct");
    }
    else if(sTag == "H2_Devil_Slaad")
    {
        PlaySound("c_slaadwek_slct");
    }
    else
    {
        return;
    }
}
