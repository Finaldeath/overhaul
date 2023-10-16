#include "mimic_inc"
void main()
{
    object oMimic = GetObjectByTag("hx_mimic");

    if(GetMimicAI(oMimic) == 0)
    {
        SetMimicAI(oMimic, 1);
        //SpeakString("AI ON");
    }
    else
    {
        SetMimicAI(oMimic, 0);
       // SpeakString("AI OFF");
    }
}
