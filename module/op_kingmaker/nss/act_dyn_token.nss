//::///////////////////////////////////////////////
//:: act_dyn_token
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the PC's religious beliefs
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    int nDeity = GetLocalInt(oPC,"os_pcbelieves");
    string sDeity;
    switch(nDeity)
    {
        case 10:
        {
            sDeity = "Pharos";
        }
        break;
        case 20:
        {
            sDeity = "Mistress Death";
        }
        break;
        case 30:
        {
            sDeity = "Callahi";
        }
        break;
        case 40:
        {
            sDeity = "Veragok";
        }
        break;
        case 50:
        {
            sDeity = "Churl";
        }
        break;
        case 60:
        {
            sDeity = "Rictos";
        }
        break;
        case 70:
        {
            sDeity = "Suhili";
        }
        break;
        case 80:
        {
            sDeity = "Jaess";
        }
        break;
        case 90:
        {
            sDeity = "Tamose";
        }
        break;
    }
    SetCustomToken(6004,sDeity);
}
