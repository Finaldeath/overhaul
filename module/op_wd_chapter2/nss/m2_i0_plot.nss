//::///////////////////////////////////////////////
//:: M2_I0_PLOT
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: May 27, 2002
//:://////////////////////////////////////////////

int GetPartyLocalInt(object oPC,string sLocalName)
{
    int nValue = 0;
    object oMember;

    oMember = GetFirstFactionMember(oPC);

    while (GetIsObjectValid(oMember))
    {
        if (GetLocalInt(oPC,sLocalName) > nValue)
        {
            nValue = GetLocalInt(oMember,sLocalName);
        }
        oMember = GetNextFactionMember(oPC);
    }

    return nValue;
}

void SetPartyLocalInt(object oPC,string sLocalName, int nValue)
{
    object oMember;

    oMember = GetFirstFactionMember(oPC);

    while (GetIsObjectValid(oMember))
    {
        SetLocalInt(oMember,sLocalName,nValue);

        oMember = GetNextFactionMember(oPC);
    }

    return;
}

object GetPartyItem(object oPC,string sItem)
{
    object oMember;
    object oItem;

    oMember = GetFirstFactionMember(oPC);

    while (GetIsObjectValid(oMember))
    {
        oItem = GetItemPossessedBy(oMember,sItem);

        if (GetIsObjectValid(GetItemPossessedBy(oMember,sItem)))
        {
            return oItem;
        }

        oMember = GetNextFactionMember(oPC);
    }

    return OBJECT_INVALID;
}
