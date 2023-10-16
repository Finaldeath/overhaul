#include "M3Q1Lab"

void main()
{
    if (GetLocalInt(GetModule(),"NW_SETUPLAB3Q1A09") == 0)
    {
        SetupLab();
        SetLocalInt(GetModule(),"NW_SETUPLAB3Q1A09",1);
    }
    CreateLabItem(GetLastSpell());
}
