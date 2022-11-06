import { createElement } from 'lwc';
import As_wiredApexOpp2 from 'c/as_wiredApexOpp2';

describe('c-as-wired-apex-opp2', () => {
    afterEach(() => {
        // The jsdom instance is shared across test cases in a single file so reset the DOM
        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }
    });

    it('TODO: test case generated by CLI command, please fill in test logic', () => {
        // Arrange
        const element = createElement('c-as-wired-apex-opp2', {
            is: As_wiredApexOpp2
        });

        // Act
        document.body.appendChild(element);

        // Assert
        // const div = element.shadowRoot.querySelector('div');
        expect(1).toBe(1);
    });
});