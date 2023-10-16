//::///////////////////////////////////////////////
//:: Name q2a_open_pcarm
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Give the PC some starting equipment based on
    his class...
    Starting equipment lists are located in the
    des_pcstart_arm.2da

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 14/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nDoOnce") == 1)
        return;
    SetLocalInt(OBJECT_SELF, "nDoOnce", 1);

    //Find the PCs highest level class
    object oPC = GetLastOpenedBy();

    int nPos1 = GetLevelByClass(GetClassByPosition(1, oPC), oPC);

    int nPos2 = GetLevelByClass(GetClassByPosition(2, oPC), oPC);

    int nPos3 = GetLevelByClass(GetClassByPosition(3, oPC), oPC);


    int nClass;
    if (nPos1 > nPos2 && nPos1 > nPos3)
        nClass = GetClassByPosition(1, oPC);
    else if (nPos2 > nPos1 && nPos2 > nPos3)
        nClass = GetClassByPosition(2, oPC);
    else
        nClass = GetClassByPosition(3, oPC);


    //Pass the higest level class to the 2da to deterine a starting weapon
    string szWeapon = Get2DAString("des_pcstart_arm", "cls_" + IntToString(nClass), 1);

    object oArm = CreateItemOnObject(szWeapon);
    SetIdentified(oArm, TRUE);
}
