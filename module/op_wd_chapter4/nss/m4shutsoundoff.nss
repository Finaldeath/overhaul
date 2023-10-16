// * shuts the ambient sound off if Maugrim is dead (the sound was of
// * combat and whatnot
void main()
{
    if (GetIsObjectValid(GetObjectByTag("M4Q01B26MAUG")) == FALSE)
    {
        AmbientSoundStop(OBJECT_SELF);
    }
}
