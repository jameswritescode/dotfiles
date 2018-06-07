import React from 'react';

export default function %FILE%(WrappedComponent) {
  function %CAMELCLASS%(props) {%HERE%
    return <WrappedComponent {...props} />;
  }

  const wrappedComponentName = WrappedComponent.displayName
    || WrappedComponent.name
    || 'Component';

  %CAMELCLASS%.displayName = `%FILE%(${wrappedComponentName})`

  return %CAMELCLASS%;
}
