// empty to avoid default behaviour

void main()
{
    int nMatch = GetListenPatternNumber();

    if (nMatch == -1)
        AssignCommand(GetLastSpeaker(), SpeakStringByStrRef(40574));
}
