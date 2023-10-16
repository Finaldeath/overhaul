// Sets custom token for dialog

#include "x0_i0_henchman"

void main()
{
    int nSpell1 = GetLocalInt(GetModule(), "X2_GOLEM_SPELL_SLOT1");
    int nSpell2 = GetLocalInt(GetModule(), "X2_GOLEM_SPELL_SLOT2");
    int nSpell3 = GetLocalInt(GetModule(), "X2_GOLEM_SPELL_SLOT3");

    object oPC = GetPCSpeaker();
    if(GetMaster(OBJECT_SELF) == OBJECT_INVALID)
    {
        AddHenchman(oPC, OBJECT_SELF);
        SetIsFollower(OBJECT_SELF, TRUE);
    }

    int nResRef;
    string sSpell1,sSpell2, sSpell3;
    string sNone = GetStringByStrRef(7444);
    if(nSpell1 == 0)
        sSpell1 = sNone;
    else
    {
        nResRef = StringToInt(Get2DAString("spells", "Name", nSpell1));
        sSpell1 = GetStringByStrRef(nResRef);
    }
    if(nSpell2 == 0)
        sSpell2 = sNone;
    else
    {
        nResRef = StringToInt(Get2DAString("spells", "Name", nSpell2));
        sSpell2 = GetStringByStrRef(nResRef);
    }
    if(nSpell3 == 0)
        sSpell3 = sNone;
    else
    {
        nResRef = StringToInt(Get2DAString("spells", "Name", nSpell3));
        sSpell3 = GetStringByStrRef(nResRef);
    }
    SetCustomToken(4201, sSpell1);
    SetCustomToken(4202, sSpell2);
    SetCustomToken(4203, sSpell3);
}
