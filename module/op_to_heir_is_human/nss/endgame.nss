void main()
{
    int iEndReady = GetLocalInt(OBJECT_SELF, "EndReady");

    if (iEndReady == TRUE)
    {
        ExportAllCharacters();
        DelayCommand(2.0, EndGame(""));
    }
}
