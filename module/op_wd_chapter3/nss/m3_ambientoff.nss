// * Turns the ambient music off if the war is over
void main()
{
    if (GetLocalInt(GetModule(), "NW_G_SIEGEOVER") == 100 && GetLocalInt(OBJECT_SELF, "NW_L_DOONCE") == 0)
    {
        AmbientSoundStop(OBJECT_SELF);
        SetLocalInt(OBJECT_SELF, "NW_L_DOONCE", 10);
    }

}
