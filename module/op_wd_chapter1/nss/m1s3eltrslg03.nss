#include "NW_I0_Plot"
void main()
{
    CreateItemOnObject("M1S3KEY2",GetPCSpeaker());
    int nNth;
    object oPin = GetObjectByTag("WP_MapNoteS3",nNth);
    while (GetIsObjectValid(oPin))
    {
        SetMapPinEnabled(oPin,TRUE);
        nNth++;
        oPin = GetObjectByTag("WP_MapNoteS3",nNth);
    }
}
