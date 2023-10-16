int StartingConditional()
{
	int l_iResult;

	l_iResult = GetTag(OBJECT_SELF) == "M1Q04CTavern02" ||
                GetTag(OBJECT_SELF) == "M1Q04CTavern04" ||
                GetTag(OBJECT_SELF) == "M1Q04CTavern06" ||
                GetTag(OBJECT_SELF) == "M1Q04CTavern08" ||
                GetTag(OBJECT_SELF) == "M1Q04CTavern10";
	return l_iResult;
}
